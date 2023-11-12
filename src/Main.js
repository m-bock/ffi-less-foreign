// @ts-check

/**
 * @type {import("../output/Main").val1}
 */
export const val1 = 13.0;

/**
 * @type {import("../output/Main").val2}
 */
export const val2 = {
  name: "Alice",
  hobbies: ["running", "swimming"],
};

/**
 * @type {import("../output/Main").val3}
 */
export const val3 = (str) => (isTrue) => {
  // Some random pure code:
  return isTrue ? str.length : 0;
};

/**
 * @type {import("../output/Main").val4}
 */
export const val4 = (str, isTrue) => {
  // Some random pure code:
  return isTrue ? str.length : 0;
};

/**
 * @type {import("../output/Main").val5}
 */
export const val5 = (opts, bool, str) => {
  // Some random side effecting code:
  
  const intervalId = setInterval(() => {
    const result = opts.onTick("abc", 13);
    console.log(result ? "Tick!" : "Tack!");
  }, 1000.0);

  return {
    cancel: () => {
      clearInterval(intervalId);
      console.log("canceled!");
    },
  };
};