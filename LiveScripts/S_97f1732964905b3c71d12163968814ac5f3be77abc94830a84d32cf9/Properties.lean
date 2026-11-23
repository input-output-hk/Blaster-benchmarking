import LiveScripts.Shared
import LiveScripts.S_97f1732964905b3c71d12163968814ac5f3be77abc94830a84d32cf9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_97f1732964905b3c71d12163968814ac5f3be77abc94830a84d32cf9.script [datum, redeemer, ctx] 10000]
