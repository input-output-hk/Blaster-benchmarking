import LiveScripts.Shared
import LiveScripts.S_8edad0df48fe66f9785b327321abb50b23d4b37bc4250504632be59e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8edad0df48fe66f9785b327321abb50b23d4b37bc4250504632be59e.script [datum, redeemer, ctx] 10000]
