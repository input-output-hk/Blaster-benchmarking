import LiveScripts.Shared
import LiveScripts.S_a4246a0d664d680f739d4d23f600b54084ced34dd4ea9796fa790dca.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a4246a0d664d680f739d4d23f600b54084ced34dd4ea9796fa790dca.script [ctx] 10000]
