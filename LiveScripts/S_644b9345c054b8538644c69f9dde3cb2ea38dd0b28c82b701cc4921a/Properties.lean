import LiveScripts.Shared
import LiveScripts.S_644b9345c054b8538644c69f9dde3cb2ea38dd0b28c82b701cc4921a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_644b9345c054b8538644c69f9dde3cb2ea38dd0b28c82b701cc4921a.script [ctx] 10000]
