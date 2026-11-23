import LiveScripts.Shared
import LiveScripts.S_00539a9514faa5fa273f818e13339bc6aeed8d70e225bc9b08c4f023.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_00539a9514faa5fa273f818e13339bc6aeed8d70e225bc9b08c4f023.script [ctx] 10000]
