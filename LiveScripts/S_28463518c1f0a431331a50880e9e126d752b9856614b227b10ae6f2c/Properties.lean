import LiveScripts.Shared
import LiveScripts.S_28463518c1f0a431331a50880e9e126d752b9856614b227b10ae6f2c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_28463518c1f0a431331a50880e9e126d752b9856614b227b10ae6f2c.script [ctx] 10000]
