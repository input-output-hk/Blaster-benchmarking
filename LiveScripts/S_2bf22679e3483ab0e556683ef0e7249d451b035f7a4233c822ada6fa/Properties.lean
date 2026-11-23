import LiveScripts.Shared
import LiveScripts.S_2bf22679e3483ab0e556683ef0e7249d451b035f7a4233c822ada6fa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2bf22679e3483ab0e556683ef0e7249d451b035f7a4233c822ada6fa.script [ctx] 10000]
