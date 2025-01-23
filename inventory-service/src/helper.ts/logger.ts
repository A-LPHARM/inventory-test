const logger = {
  info: (message) => console.log({ type: "INFO", log: message }),
  error: (message) => console.log({ type: "ERROR", log: message }),
};

export default logger;
