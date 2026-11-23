import LiveScripts.Shared
import LiveScripts.S_97e22b8e5dbadc969a5008934350a974629e74e64b33138c36531d92.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_97e22b8e5dbadc969a5008934350a974629e74e64b33138c36531d92.script [ctx] 10000]
