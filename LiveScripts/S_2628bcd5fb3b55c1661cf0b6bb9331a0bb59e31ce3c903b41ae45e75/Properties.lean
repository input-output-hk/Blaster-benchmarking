import LiveScripts.Shared
import LiveScripts.S_2628bcd5fb3b55c1661cf0b6bb9331a0bb59e31ce3c903b41ae45e75.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2628bcd5fb3b55c1661cf0b6bb9331a0bb59e31ce3c903b41ae45e75.script [datum, redeemer, ctx] 10000]
