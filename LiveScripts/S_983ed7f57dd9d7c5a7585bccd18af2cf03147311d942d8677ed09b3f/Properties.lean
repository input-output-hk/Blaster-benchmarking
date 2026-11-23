import LiveScripts.Shared
import LiveScripts.S_983ed7f57dd9d7c5a7585bccd18af2cf03147311d942d8677ed09b3f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_983ed7f57dd9d7c5a7585bccd18af2cf03147311d942d8677ed09b3f.script [ctx] 10000]
