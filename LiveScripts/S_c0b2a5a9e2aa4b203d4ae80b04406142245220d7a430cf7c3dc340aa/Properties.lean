import LiveScripts.Shared
import LiveScripts.S_c0b2a5a9e2aa4b203d4ae80b04406142245220d7a430cf7c3dc340aa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c0b2a5a9e2aa4b203d4ae80b04406142245220d7a430cf7c3dc340aa.script [datum, redeemer, ctx] 10000]
