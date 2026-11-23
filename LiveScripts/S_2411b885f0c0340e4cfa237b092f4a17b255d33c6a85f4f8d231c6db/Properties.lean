import LiveScripts.Shared
import LiveScripts.S_2411b885f0c0340e4cfa237b092f4a17b255d33c6a85f4f8d231c6db.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2411b885f0c0340e4cfa237b092f4a17b255d33c6a85f4f8d231c6db.script [ctx] 10000]
