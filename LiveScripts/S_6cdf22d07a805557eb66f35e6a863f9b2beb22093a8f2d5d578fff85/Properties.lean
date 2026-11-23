import LiveScripts.Shared
import LiveScripts.S_6cdf22d07a805557eb66f35e6a863f9b2beb22093a8f2d5d578fff85.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6cdf22d07a805557eb66f35e6a863f9b2beb22093a8f2d5d578fff85.script [ctx] 10000]
