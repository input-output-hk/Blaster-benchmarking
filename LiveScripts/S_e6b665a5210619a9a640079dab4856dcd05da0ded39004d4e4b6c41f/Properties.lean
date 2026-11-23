import LiveScripts.Shared
import LiveScripts.S_e6b665a5210619a9a640079dab4856dcd05da0ded39004d4e4b6c41f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e6b665a5210619a9a640079dab4856dcd05da0ded39004d4e4b6c41f.script [ctx] 10000]
