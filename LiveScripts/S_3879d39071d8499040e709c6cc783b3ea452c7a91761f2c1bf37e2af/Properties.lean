import LiveScripts.Shared
import LiveScripts.S_3879d39071d8499040e709c6cc783b3ea452c7a91761f2c1bf37e2af.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3879d39071d8499040e709c6cc783b3ea452c7a91761f2c1bf37e2af.script [ctx] 10000]
