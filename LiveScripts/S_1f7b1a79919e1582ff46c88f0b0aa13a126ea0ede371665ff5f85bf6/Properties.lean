import LiveScripts.Shared
import LiveScripts.S_1f7b1a79919e1582ff46c88f0b0aa13a126ea0ede371665ff5f85bf6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1f7b1a79919e1582ff46c88f0b0aa13a126ea0ede371665ff5f85bf6.script [ctx] 10000]
