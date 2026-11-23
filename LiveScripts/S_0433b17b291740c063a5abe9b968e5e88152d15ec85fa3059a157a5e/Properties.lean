import LiveScripts.Shared
import LiveScripts.S_0433b17b291740c063a5abe9b968e5e88152d15ec85fa3059a157a5e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0433b17b291740c063a5abe9b968e5e88152d15ec85fa3059a157a5e.script [ctx] 10000]
