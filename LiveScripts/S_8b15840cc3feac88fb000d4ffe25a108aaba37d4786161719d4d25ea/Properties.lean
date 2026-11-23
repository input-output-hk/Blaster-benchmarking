import LiveScripts.Shared
import LiveScripts.S_8b15840cc3feac88fb000d4ffe25a108aaba37d4786161719d4d25ea.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8b15840cc3feac88fb000d4ffe25a108aaba37d4786161719d4d25ea.script [ctx] 10000]
