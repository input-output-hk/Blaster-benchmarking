import LiveScripts.Shared
import LiveScripts.S_74157d54085eeb9afeb2b8b852166e18a1934716c3201869d54ee0f3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_74157d54085eeb9afeb2b8b852166e18a1934716c3201869d54ee0f3.script [datum, redeemer, ctx] 10000]
