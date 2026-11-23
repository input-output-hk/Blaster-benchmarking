import LiveScripts.Shared
import LiveScripts.S_a395ada2feb783f84d3b8294406503f1351e7d192ef64aba39c7806b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a395ada2feb783f84d3b8294406503f1351e7d192ef64aba39c7806b.script [ctx] 10000]
