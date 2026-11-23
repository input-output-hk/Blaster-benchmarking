import LiveScripts.Shared
import LiveScripts.S_04eb6cee8c66cc72ceedf355fbdceaaeca3b70043922e54979a8d5ed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_04eb6cee8c66cc72ceedf355fbdceaaeca3b70043922e54979a8d5ed.script [ctx] 10000]
