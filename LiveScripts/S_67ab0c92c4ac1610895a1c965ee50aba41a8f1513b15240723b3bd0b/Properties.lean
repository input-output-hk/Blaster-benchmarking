import LiveScripts.Shared
import LiveScripts.S_67ab0c92c4ac1610895a1c965ee50aba41a8f1513b15240723b3bd0b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_67ab0c92c4ac1610895a1c965ee50aba41a8f1513b15240723b3bd0b.script [ctx] 10000]
