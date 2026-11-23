import LiveScripts.Shared
import LiveScripts.S_96a1ec67ad9330315f8b7cac12b7bcf866de5a9706ba95b99dc9a47b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_96a1ec67ad9330315f8b7cac12b7bcf866de5a9706ba95b99dc9a47b.script [ctx] 10000]
