import LiveScripts.Shared
import LiveScripts.S_40e1aeb4f5290fb65b1dcda43381354e6cb8850bc00d0e404e2cbfc7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_40e1aeb4f5290fb65b1dcda43381354e6cb8850bc00d0e404e2cbfc7.script [ctx] 10000]
