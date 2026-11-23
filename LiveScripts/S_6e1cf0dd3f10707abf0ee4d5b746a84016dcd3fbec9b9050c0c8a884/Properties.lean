import LiveScripts.Shared
import LiveScripts.S_6e1cf0dd3f10707abf0ee4d5b746a84016dcd3fbec9b9050c0c8a884.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6e1cf0dd3f10707abf0ee4d5b746a84016dcd3fbec9b9050c0c8a884.script [ctx] 10000]
