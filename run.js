const fs = require("fs");

(async () => {
  // Load the WebAssembly binary.
  const wasmBuffer = fs.readFileSync("./main.wasm");

  // Instantiate the WebAssembly module.
  const { instance } = await WebAssembly.instantiate(wasmBuffer, {});

  // Get the exported function and memory.
  const { hello, memory } = instance.exports;

  // Call the function to get a pointer to the string.
  const ptr = hello();

  // Create a view of the module's memory.
  const mem = new Uint8Array(memory.buffer);

  // Read the null-terminated string starting at 'ptr'.
  let result = "";
  for (let i = ptr; mem[i] !== 0; i++) {
    result += String.fromCharCode(mem[i]);
  }

  console.log(result);
})();
