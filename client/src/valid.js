export function isValidDate(value) {
  let date = value.trim().split(".");
  if (date.length !== 3 || date.indexOf("") != -1) return false;
  let checkDate = new Date(`${date[1]}.${date[0]}.${date[2]}`);
  if (checkDate.toString() === "Invalid Date") return false;

  return true;
}

export function isValidFioAndBirthday(value) {
  let checkValue = value.trim().split(" ");

  if (checkValue.length === 3 || checkValue.length === 4) {
    return isValidDate(checkValue[checkValue.length - 1]);
  }

  return false;
}

export function isValidEnp(value) {
  return value.length === 16 && Boolean(parseInt(value));
}
