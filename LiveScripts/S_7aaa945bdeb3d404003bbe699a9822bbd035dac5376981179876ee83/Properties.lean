import LiveScripts.Shared
import LiveScripts.S_7aaa945bdeb3d404003bbe699a9822bbd035dac5376981179876ee83.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7aaa945bdeb3d404003bbe699a9822bbd035dac5376981179876ee83.script [ctx] 10000]
