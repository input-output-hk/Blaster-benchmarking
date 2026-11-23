import LiveScripts.Shared
import LiveScripts.S_8941bf81d80e53261fbdb316ace38d7bf03ade7eab01ac7451ae149b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8941bf81d80e53261fbdb316ace38d7bf03ade7eab01ac7451ae149b.script [ctx] 10000]
