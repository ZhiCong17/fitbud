import { Controller } from "@hotwired/stimulus"
import { Timer } from "easytimer.js";

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["exercise", "tracker", "form", "trackerCount", "time", "set"]
  static values = {
    alarm: String,
  }

  connect() {
    this.timer = new Timer({startValues: {seconds: 3}});

    // this.timeTarget.innerText = this.timer.getTimeValues().toString().substring(3);

    this.alarm = new Audio(this.alarmValue);
  }

  continueExercise(data) {
    console.log('continuing...');

    this.startTimer()

    this.trackerCountTarget.innerText = data.set
    this.formTarget.outerHTML = data.tracker_form
    // this.exerciseTarget.innerHTML = data.inserted_item_exercise
    this.trackerTarget.insertAdjacentHTML("beforeend", data.inserted_item_tracker)
    this.trackerTarget.className = "card p-3 lh-base"

    this.countdownComplete()
  }

  nextExercise(data) {
    console.log('nextExercise');

    this.startTimer()

    this.trackerCountTarget.innerText = data.set
    this.formTarget.outerHTML = data.tracker_form
    this.trackerTarget.insertAdjacentHTML("beforeend", data.inserted_item_tracker)

    this.countdownComplete(data.next_exercise)
  }

  formError(data) {
    console.log('error....');
    this.formTarget.outerHTML = data.tracker_form
  }

  workoutComplete(data) {
    console.log('Done!');
    this.formTarget.outerHTML = data.tracker_form
    this.exerciseTarget.innerHTML = data.inserted_item_exercise
    this.trackerTarget.insertAdjacentHTML("beforeend", data.inserted_item_tracker)
    this.trackerTarget.insertAdjacentHTML("afterbegin", data.completion_message)
  }

  startTimer() {
    this.timer.start({countdown: true, startValues: {minutes: this.timeTarget.innerText.substring(0,2), seconds: this.timeTarget.innerText.substring(3)}});

    this.timer.addEventListener('secondsUpdated', function (e) {
      console.log(e.detail.timer.getTimeValues().toString());
      this.timeTarget.innerText = e.detail.timer.getTimeValues().toString().substring(3);
    }.bind(this));
  }

  resetTimer() {
    this.timer.reset();
    this.timer.pause();
    this.timeTarget.innerText = this.timer.getTimeValues().toString().substring(3);
    // to add alarm sound file
  }

  countdownComplete(next_exercise) {
    this.timer.addEventListener('targetAchieved',  function (e) {
      console.log("Rest over");

      this.alarm.play();
        // if this is the last set
        if (this.trackerCountTarget.innerText == this.setTarget.innerText) {
          // then redirect
          setTimeout(() => {
            window.location.href = next_exercise
          }, 3000);
        }
        // if not then reset
        else {
          this.resetTimer();
        }
    }.bind(this));
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
    .then(data => this[data.status](data))
  }
}
