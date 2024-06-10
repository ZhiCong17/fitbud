import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["div"]

  connect() {
    console.log("countdown connected");

    const timer = new EasyTimer();
    timer.start({ countdown: true, startValues: { seconds: 30 } });

    divTarget.innerText = timer.getTimeValues().toString();
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
