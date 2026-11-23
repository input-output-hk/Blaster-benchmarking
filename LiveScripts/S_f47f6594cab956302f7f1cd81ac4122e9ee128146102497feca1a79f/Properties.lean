import LiveScripts.Shared
import LiveScripts.S_f47f6594cab956302f7f1cd81ac4122e9ee128146102497feca1a79f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f47f6594cab956302f7f1cd81ac4122e9ee128146102497feca1a79f.script [ctx] 10000]
