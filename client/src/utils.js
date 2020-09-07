export function errorInput(input) {
  input.classList.add("invalid");
}

export function successInput(input) {
  input.classList.remove("invalid");
}

export function loaderActive(l) {
  l.classList.remove("progress-none");
}

export function loaderHidden(l) {
  l.classList.add("progress-none");
}

export function answerCard(answ) {
  return `<div class="col s12 m7">
          <div class="card horizontal">
              <div class="card-stacked">
                  <div class="card-content">
                      ${answ["serchValue"].join(" ")} –  ${answ["answer"]}
                  </div>
              </div>
          </div>
        </div>
`;
}
