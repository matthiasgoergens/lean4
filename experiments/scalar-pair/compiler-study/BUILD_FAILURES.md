Two failed follow-up builds were retained as diagnostic notes before rerunning.

Registering two separate compiler-pass installers in the plugin triggered an attempt to evaluate the plugin option initialiser while compiling the same module. Combining both registrations in one final installer avoids this.

The subsequent build returned status zero despite an environment-extension panic. A default mainOnly extension cannot be modified in the compiler’s asynchronous context. Use a local extension for worker names within this compilation branch, and reject panic diagnostics independently of process status. No timings from either failed build were accepted.

```text
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
PANIC at Lean.EnvExtension.modifyState Lean.Environment:1414:13: environment extension is marked as `mainOnly` but used in async context '__reserved__Environment_promiseChecked'
```
