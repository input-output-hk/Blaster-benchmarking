import LiveScripts.Shared
import LiveScripts.S_76bcfff830ea445d6395dd65d148fdc11a47b625a609bf7484a2a201.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_76bcfff830ea445d6395dd65d148fdc11a47b625a609bf7484a2a201.script [ctx] 10000]
