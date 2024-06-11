import { Controller } from "@hotwired/stimulus"
import { Timer } from "easytimer.js";

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["time"]

  timer = new Timer({startValues: { minutes: 1, seconds: 30 }});

  connect() {
     this.timeTarget.innerText = this.timer.getTimeValues().toString();
  }

  startTimer() {
    this.timer.start({ countdown: true, startValues: { minutes: 1, seconds: 30 } });

    this.updateTimerDisplay();
  }

  updateTimerDisplay() {
    // let timerDisplay = this.timeTarget.innerText

    // if (timerDisplay) {
    //   timerDisplay = this.timer.getTimeValues().toString();
    // }

    fetch(this.timer.getTimeValues())
      .then(response => {console.log(response);})
      .then((data) => {
        console.log(data);
      })
  }

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
}
