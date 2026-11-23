import LiveScripts.Shared
import LiveScripts.S_1b26cc41dcd8530a4ba9ae584922b5957c365583a25eda8770597a6b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1b26cc41dcd8530a4ba9ae584922b5957c365583a25eda8770597a6b.script [ctx] 10000]
