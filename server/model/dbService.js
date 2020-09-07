const mysql = require("mysql");
const keys = require("../config/keys");
let instance = null;

const connection = mysql.createConnection({
  host: keys.DB.host,
  user: keys.DB.user,
  password: keys.DB.password,
  database: keys.DB.database,
});

connection.connect((err) => {
  if (err) {
    console.log(err.message);
  }
  console.log("DB " + connection.state);
});

class DbService {
  static getDbServiceInstance() {
    return instance ? instance : new DbService();
  }

  async getHoneyOrganization(id) {
    try {
      const response = await new Promise((resolve, reject) => {
        const query = `
          SELECT pid, name_depth, nam_mo, caption FROM histlpu
          LEFT JOIN lpu ON histlpu.lpu = lpu.code
          LEFT JOIN т007 ON histlpu.subdiv = т007.depth
          LEFT JOIN т001 ON т007.nom_podr = т001.nom_podr
          WHERE histlpu.pid = ${id} AND histlpu.lpudx IS NULL
        `;
        connection.query(query, (err, results) => {
          if (err) reject(new Error(err.message));
          resolve(
            `${results[0].caption} ${
              !results[0].nam_mo ? "" : ", " + results[0].nam_mo
            }
            ${!results[0].name_depth ? "" : ", " + results[0].name_depth}`
          );
        });
      });

      return response;
    } catch (error) {
      console.log(error);
    }
  }

  async searchByNameAndBirthday(serch) {
    try {
      const response = await new Promise((resolve, reject) => {
        const query = `
        SELECT CASE
              WHEN people.lpu is NULL THEN 'Гражданин не прикреплен'
              WHEN people.lpudx is NOT NULL THEN 'Гражданин не прикреплен'
              ELSE people.id
            END AS ans
        FROM people
        WHERE im="${serch.im}" AND fam="${serch.fam}" ${
          serch.ot ? 'AND ot="${serch.ot}"' : ""
        } AND dr="${serch.dr}"
        `;
        connection.query(query, (err, results) => {
          if (err) reject(new Error(err.message));

          if (!results.length)
            return resolve("По данному запросу ничего не найдено");
          if (!Number(results[0].ans)) return resolve(results[0].ans);

          this.getHoneyOrganization(results[0].ans).then((answer) => {
            return resolve("Гражданин прикреплен к " + answer);
          });
        });
      });

      return response;
    } catch (error) {
      console.log(error);
    }
  }

  async searchByEnp(enp) {
    try {
      const response = await new Promise((resolve, reject) => {
        const query = `
        SELECT CASE
          WHEN people.lpu is NULL THEN 'Гражданин с таким полисом не прикреплен'
          WHEN people.lpudx is NOT NULL THEN 'Гражданин с таким полисом не прикреплен'
          ELSE people.id
          END AS ans
        FROM people
        WHERE enp="${enp}"
        `;

        connection.query(query, (err, results) => {
          if (err) reject(new Error(err.message));

          if (!results.length) return resolve("Полис не найден");
          if (!Number(results[0].ans)) return resolve(results[0].ans);

          this.getHoneyOrganization(results[0].ans).then((answer) => {
            return resolve(`Гражданин с таким полисом прикреплен к ${answer}`);
          });
        });
      });

      return response;
    } catch (error) {
      console.log(error);
    }
  }
}

module.exports = DbService;
