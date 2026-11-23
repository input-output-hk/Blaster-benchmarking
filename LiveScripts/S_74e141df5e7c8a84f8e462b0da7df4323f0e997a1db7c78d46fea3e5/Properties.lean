import LiveScripts.Shared
import LiveScripts.S_74e141df5e7c8a84f8e462b0da7df4323f0e997a1db7c78d46fea3e5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_74e141df5e7c8a84f8e462b0da7df4323f0e997a1db7c78d46fea3e5.script [ctx] 10000]
