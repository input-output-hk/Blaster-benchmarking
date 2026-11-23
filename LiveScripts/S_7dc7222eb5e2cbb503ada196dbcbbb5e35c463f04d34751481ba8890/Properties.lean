import LiveScripts.Shared
import LiveScripts.S_7dc7222eb5e2cbb503ada196dbcbbb5e35c463f04d34751481ba8890.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7dc7222eb5e2cbb503ada196dbcbbb5e35c463f04d34751481ba8890.script [ctx] 10000]
