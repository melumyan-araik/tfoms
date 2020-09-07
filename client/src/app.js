import "./style.css";

import { isValidEnp, isValidFioAndBirthday } from "./valid";
import {
  errorInput,
  successInput,
  loaderActive,
  loaderHidden,
  answerCard,
} from "./utils";

const form = document.getElementById("form");
const input = form.querySelector("#payload");
const loader = document.querySelector(".progress");
input.addEventListener("keydown", keydownEnter);
input.addEventListener("submit", submitFormHandler);

input.onfocus = input.onblur = () => {
  document.querySelectorAll(".payload").forEach((item) => {
    item.classList.add("active");
  });
};
input.onblur = () => {
  document.querySelectorAll(".payload").forEach((item) => {
    item.classList.remove("active");
  });
};

function active(e) {
  console.log(e.target);
}

function keydownEnter(e) {
  if (e.keyCode === 13) {
    submitFormHandler(e);
  }
}

async function submitFormHandler(e) {
  e.preventDefault();
  if (!e.target.value) {
    errorInput(input);
    return;
  }

  if (isValidFioAndBirthday(e.target.value) || isValidEnp(e.target.value)) {
    successInput(input);
    loaderActive(loader);
    document.getElementById("answer").innerHTML = "";
    const serchValue = e.target.value;
    await fetch("https://tfoms.herokuapp.com/api/person/" + serchValue)
      .then((res) => res.json())
      .then((data) => {
        document.getElementById("answer").innerHTML = answerCard(data);
      });
    loaderHidden(loader);
    input.value = "";
  } else {
    errorInput(input);
    M.toast({ html: "Неверный формат данных. Попробуйте снова" });
  }
}
