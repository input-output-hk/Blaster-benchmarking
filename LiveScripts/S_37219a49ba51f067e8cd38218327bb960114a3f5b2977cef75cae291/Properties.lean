import LiveScripts.Shared
import LiveScripts.S_37219a49ba51f067e8cd38218327bb960114a3f5b2977cef75cae291.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_37219a49ba51f067e8cd38218327bb960114a3f5b2977cef75cae291.script [ctx] 10000]
