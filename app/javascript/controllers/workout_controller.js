import { Controller } from "@hotwired/stimulus"
import { Timer } from "easytimer.js";

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["exercise", "tracker", "form"]

  // timer = new Timer({startValues: { minutes: 1, seconds: 30 }});

  connect() {
    //  this.timeTarget.innerText = this.timer.getTimeValues().toString();
  }

  updateSet(event) {
    event.preventDefault();
    const url = event.currentTarget.action

    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(event.currentTarget)
    })
    .then(response => response.json())
    .then(data => {

      if (data.success) {
        this.trackerTarget.insertAdjacentHTML("beforeend", data.inserted_item)
      }
      else {
        this.formTarget.outerHTML = data.form
      }
    })
  }
}
  // startTimer() {
  //   this.timer.start({ countdown: true, startValues: { minutes: 1, seconds: 30 } });

  //   this.updateTimerDisplay();
  // }

  // updateTimerDisplay() {
    // let timerDisplay = this.timeTarget.innerText

    // if (timerDisplay) {
    //   timerDisplay = this.timer.getTimeValues().toString();
    // }
    // console.log(this.timer.getTimeValues());

    // fetch(this.timer.getTimeValues())
    //   .then(response => console.log(response.json()))
    //   .then((data) => {
    //     console.log(data);
    //   })

  // countdown() {
  //   timer.start({countdown: true, startValues: {seconds: 30}});

  //   $('#countdownExample .values').html(timer.getTimeValues().toString());

  //   timer.addEventListener('secondsUpdated', function (e) {
  //       $('#countdownExample .values').html(timer.getTimeValues().toString());
  //   });

  //   timer.addEventListener('targetAchieved', function (e) {
  //       $('#countdownExample .values').html('KABOOM!!');
  //   });
  // }
