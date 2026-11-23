import LiveScripts.Shared
import LiveScripts.S_92e9c9eef30c1ece4635e9b1926f5855855518495cc525fd958c6fe1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_92e9c9eef30c1ece4635e9b1926f5855855518495cc525fd958c6fe1.script [ctx] 10000]
