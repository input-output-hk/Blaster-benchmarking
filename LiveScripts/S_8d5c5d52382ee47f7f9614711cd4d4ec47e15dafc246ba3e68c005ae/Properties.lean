import LiveScripts.Shared
import LiveScripts.S_8d5c5d52382ee47f7f9614711cd4d4ec47e15dafc246ba3e68c005ae.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8d5c5d52382ee47f7f9614711cd4d4ec47e15dafc246ba3e68c005ae.script [ctx] 10000]
