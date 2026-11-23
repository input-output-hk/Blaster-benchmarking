import LiveScripts.Shared
import LiveScripts.S_6b26301bbe19fdaca1ebeda5540a0715d5a6932c068a7f86aee9dac7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6b26301bbe19fdaca1ebeda5540a0715d5a6932c068a7f86aee9dac7.script [ctx] 10000]
