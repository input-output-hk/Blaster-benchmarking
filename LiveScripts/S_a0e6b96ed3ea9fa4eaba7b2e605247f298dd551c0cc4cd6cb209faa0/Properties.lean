import LiveScripts.Shared
import LiveScripts.S_a0e6b96ed3ea9fa4eaba7b2e605247f298dd551c0cc4cd6cb209faa0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a0e6b96ed3ea9fa4eaba7b2e605247f298dd551c0cc4cd6cb209faa0.script [datum, redeemer, ctx] 10000]
