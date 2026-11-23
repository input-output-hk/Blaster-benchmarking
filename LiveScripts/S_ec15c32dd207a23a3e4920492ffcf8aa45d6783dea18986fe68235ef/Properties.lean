import LiveScripts.Shared
import LiveScripts.S_ec15c32dd207a23a3e4920492ffcf8aa45d6783dea18986fe68235ef.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ec15c32dd207a23a3e4920492ffcf8aa45d6783dea18986fe68235ef.script [datum, redeemer, ctx] 10000]
