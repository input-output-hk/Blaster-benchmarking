import LiveScripts.Shared
import LiveScripts.S_b167f9fd68078d24e227c29c23c0d99106412d3e4edd9f83e55c45ed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b167f9fd68078d24e227c29c23c0d99106412d3e4edd9f83e55c45ed.script [ctx] 10000]
