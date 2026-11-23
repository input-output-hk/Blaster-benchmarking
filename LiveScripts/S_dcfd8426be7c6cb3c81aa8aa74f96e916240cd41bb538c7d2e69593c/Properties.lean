import LiveScripts.Shared
import LiveScripts.S_dcfd8426be7c6cb3c81aa8aa74f96e916240cd41bb538c7d2e69593c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dcfd8426be7c6cb3c81aa8aa74f96e916240cd41bb538c7d2e69593c.script [ctx] 10000]
