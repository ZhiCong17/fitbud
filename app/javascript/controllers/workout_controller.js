import { Controller } from "@hotwired/stimulus"
import { Timer } from "easytimer.js";

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["exercise", "tracker", "form"]


  connect() {
    this.timer = new Timer();

    this.timer.start({countdown: true, startValues: {seconds: 5}});
    // timer.start();

    this.timer.addEventListener('secondsUpdated', function (e) {
      console.log(e.detail.timer.getTimeValues());
    });

    this.timer.addEventListener('targetAchieved', function (e) {
      console.log(e);
  });

    //  this.timeTarget.innerText = this.timer.getTimeValues().toString();
  }

  continueExercise(data) {
    console.log('continuing...');
    this.formTarget.outerHTML = data.tracker_form
    this.exerciseTarget.innerHTML = data.inserted_item_exercise
    this.trackerTarget.insertAdjacentHTML("beforeend", data.inserted_item_tracker)
  }

  nextExercise(data) {
    console.log('nextExercise');
    window.location.href = data.next_exercise
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
