import LiveScripts.Shared
import LiveScripts.S_d4e0b170fc503735b260b1a0c99223c2b4e6dd6e87ccdcabfba28b8a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d4e0b170fc503735b260b1a0c99223c2b4e6dd6e87ccdcabfba28b8a.script [redeemer, ctx] 10000]
