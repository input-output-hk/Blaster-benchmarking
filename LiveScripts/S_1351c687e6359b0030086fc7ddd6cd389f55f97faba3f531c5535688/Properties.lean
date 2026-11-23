import LiveScripts.Shared
import LiveScripts.S_1351c687e6359b0030086fc7ddd6cd389f55f97faba3f531c5535688.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1351c687e6359b0030086fc7ddd6cd389f55f97faba3f531c5535688.script [ctx] 10000]
