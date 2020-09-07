module.exports.getPerson = (req, res) => {
  const DbService = require("../model/dbService").getDbServiceInstance();
  const params = req.params["serchValue"].split(" ");

  if (params.length === 1) {
    if (params[0].length === 16) {
      return DbService.searchByEnp(params[0])
        .then((data) =>
          res.status(200).json({
            serchValue: params,
            answer: data,
          })
        )
        .catch((err) => console.log(err));
    }
  } else if (params.length === 3 || params.length === 4) {
    let birthday = params[params.length - 1].split(".");
    birthday = `${birthday[2]}-${birthday[1]}-${birthday[0]}`;

    return DbService.searchByNameAndBirthday({
      fam: params[0],
      im: params[1],
      ot: params.length === 3 ? null : params[2],
      dr: birthday,
    })
      .then((data) =>
        res.status(200).json({
          serchValue: params,
          answer: data,
        })
      )
      .catch((err) => console.log(err));
  }

  res.status(404).json({
    serchValue: req.params["serchValue"],
    answer: "По данному запросу ничего не найдено",
  });
};
