import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300; //variable
  currentValue := 300;
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 223344534343454; //constant
  //Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withDraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount is too large to withdraw! Not much money here.");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapseNS = currentTime - startTime;
    let timeElapseS = timeElapseNS / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapseS));
    startTime := currentTime;
  };
  //topUp();
}